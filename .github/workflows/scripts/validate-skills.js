// Validates YAML frontmatter in all .grok/skills/*/SKILL.md files.
// Checks for: valid YAML syntax, required fields, semantic version format.

import { readFileSync, readdirSync, existsSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const SKILLS_DIR = join(__dirname, "..", "..", "..", ".grok", "skills");

const REQUIRED_FIELDS = ["name", "description", "version", "author"];
const SEMVER_RE = /^\d+\.\d+\.\d+$/;

let errors = [];
let checked = 0;
let passed = 0;

function parseFrontmatter(text) {
  const lines = text.split(/\r?\n/);
  if (lines[0]?.trim() !== "---") return null;

  const endIndex = lines.indexOf("---", 1);
  if (endIndex === -1) return null;

  const yamlBlock = lines.slice(1, endIndex).join("\n");
  const fields = {};

  for (const line of yamlBlock.split("\n")) {
    const match = line.match(/^([a-zA-Z_-]+):\s*(.+)$/);
    if (match) {
      fields[match[1]] = match[2].trim();
    } else if (line.trim() && !line.match(/^#/)) {
      // Non-comment, non-key:value line inside frontmatter
      fields["__parse_issue"] = (fields["__parse_issue"] || "") + line + "\n";
    }
  }

  return fields;
}

function checkSkill(skillName) {
  const skillFile = join(SKILLS_DIR, skillName, "SKILL.md");
  if (!existsSync(skillFile)) {
    errors.push(`[${skillName}] Missing SKILL.md at ${skillFile}`);
    return;
  }

  const content = readFileSync(skillFile, "utf-8");
  const frontmatter = parseFrontmatter(content);

  if (!frontmatter) {
    errors.push(`[${skillName}] No valid YAML frontmatter (--- ... ---)`);
    return;
  }

  if (frontmatter["__parse_issue"]) {
    errors.push(
      `[${skillName}] Unparseable line(s) in frontmatter: ${frontmatter["__parse_issue"].trim()}`
    );
    return;
  }

  for (const field of REQUIRED_FIELDS) {
    if (!frontmatter[field]) {
      errors.push(`[${skillName}] Missing required field: "${field}"`);
    }
  }

  if (frontmatter["version"] && !SEMVER_RE.test(frontmatter["version"])) {
    errors.push(
      `[${skillName}] Invalid version "${frontmatter["version"]}" — must be semver (e.g., 1.0.0)`
    );
  }

  if (errors.length === 0 || errors.every((e) => !e.includes(skillName))) {
    passed++;
    console.log(`  ✓ ${skillName} (v${frontmatter["version"] || "?"})`);
  } else {
    console.log(`  ✗ ${skillName}`);
  }
  checked++;
}

// --- Main ---
console.log("Validating skill frontmatter...\n");

const skillDirs = readdirSync(SKILLS_DIR, { withFileTypes: true })
  .filter((d) => d.isDirectory())
  .map((d) => d.name);

if (skillDirs.length === 0) {
  errors.push("No skill directories found under .grok/skills/");
} else {
  for (const skill of skillDirs) {
    checkSkill(skill);
  }
}

console.log(`\n${passed}/${checked} skills passed.`);

if (errors.length > 0) {
  console.log(`\n${errors.length} error(s):`);
  for (const err of errors) {
    console.log(`  ✗ ${err}`);
  }
  process.exit(1);
} else {
  console.log("All skills have valid frontmatter.");
}

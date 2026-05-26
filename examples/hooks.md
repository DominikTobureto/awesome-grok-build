# Hook Examples

Grok Build hook conventions may evolve. Treat these as design patterns, not official file-format documentation.

## Low-Risk Hook Ideas

| Hook | Trigger | Command | Mutates files |
| --- | --- | --- | --- |
| Lint touched files | After edit | project linter | No |
| Format touched files | After edit | formatter | Yes, limited |
| Dangerous command guard | Before shell command | pattern check | No |
| Completion notifier | Stop/session end | desktop notification | No |
| Test failure summarizer | After test command | parse output | No |

## Dangerous Command Guard Prompt

```text
Design a Grok Build hook that warns before shell commands matching destructive patterns such as recursive delete, force push, database drop, or chmod/chown over broad paths. Keep it read-only and explain how to disable it.
```

## Post-Edit Lint Prompt

```text
Design a project hook that runs the existing lint command after edits and reports failures back to the Grok session. It should not auto-fix yet. Use the repo's actual package/config files to discover the command.
```

## Trust Checklist

Before running `/hooks-trust`, verify:

- every command is documented;
- no command reads secrets;
- no command sends data to the network unless intended;
- mutating hooks touch only expected files;
- failure behavior is visible to the user;
- the hook can be disabled quickly.

# Contributing to SnapSet

Thank you for your interest in SnapSet.

## Reporting issues

- Check existing issues before opening a new one
- Include your Windows version and build number
- Describe the command you ran and what happened vs what you expected

## Suggesting features

- Open an issue with the label `enhancement`
- Describe the settings page or shortcut you want added
- Include the `ms-settings:` URI if you know it

## Submitting changes

1. Fork the repository
2. Create a branch from `dev`, not `main`
3. Make your changes
4. Test on Windows 11 before submitting
5. Open a Pull Request targeting the `dev` branch

## Testing

There is no automated test suite. Before submitting, run the modified script manually and confirm:

- Each affected command opens the correct settings page
- The help screen displays correctly when no argument is passed
- An unrecognised command produces an error message and exits with code 1

## Commit messages

Use [Conventional Commits](https://www.conventionalcommits.org) for all commit messages.

| Prefix | Use for |
|--------|---------|
| `feat:` | A new command or feature |
| `fix:` | A bug fix |
| `docs:` | README, CHANGELOG, or documentation changes |
| `chore:` | Housekeeping (.gitignore, config, structure) |
| `refactor:` | Code restructured, behaviour unchanged |

Example: `feat: add bt/bluetooth command`

## Code style

- Keep batch commands concise
- Follow the existing short/long alias pattern for all new commands
- Add a `rem` comment line above each new command group using this format:

```bat
rem Short description, purpose and any relevant notes
```

- Section dividers use 60 dashes:

```bat
rem ------------------------------------------------------------
rem SECTION NAME
rem ------------------------------------------------------------
```

## License

By contributing, you agree your contributions are licensed under the [MIT License](LICENSE).

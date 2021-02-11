# Checkstyle configuration

## Install pre-push hook for checkstyle checks

The project uses the following git hook (commands executed on `git commit`):

- pre-push: Checks the coding conventions using checkstyle

Run the following command to set up the git hooks:

```
git config core.hooksPath config/hooks
```

The git hooks can be skipped with `--no-verify`.

## Configure code formatting 

Follow these steps to set up checkstyle and auto format in IntelliJ:

- Install the `CheckStyle-IDEA` plugin in IntelliJ
- Open IntelliJ settings > Editor > Code Style > Java > Scheme > Import Scheme > CheckStyle Configuration > Select the `checkstyle.xml` > Apply

Run auto format:

- Right click the appropriate folder or file in the `Project` tool window > Reformat Code > Check `Optimize imports` > Run

If you're unable to resolve this issue on the individual file level, try on the root project level.
- Right click on the project root dir and in the `Project` tool window > Reformat Code > Check `Optimize imports` > Run

Enable Editor -> General -> Auto Import -> `Optimize imports on the fly` to make sure that the import is always up-to-date

## Run checkstyle from CLI

Run checkstyle from the command line in the Maven project directory:

```
mvn checkstyle:check
```

## Run checkstyle from IntelliJ

Optional: Follow these steps to run checkstyle from IntelliJ instead of the command line:

- Open IntelliJ settings > Tools > Checkstyle > Configuration File > Add
- Enter a description (e.g. `Checkstyle`) > Select `Use local Checkstyle file` > Browse > Select the `checkstyle.xml` > Select `Next` twice > Finish
- Select the `Active` checkbox for the configuration > Apply

Run checkstyle from IntelliJ:

- Open `CheckStyle` from the bottom toolbar in IntelliJ
- Select the appropriate button (e.g. `Check Current File`, `Check Project`)

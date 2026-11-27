# How to build (Mod)

## Common setup
* Install Arma 3 Tools in the same steam library that Arma 3 is installed in

## With HEMTT (supported)

Antistasi Ultimate is built and released with [HEMTT](https://hemtt.dev).
New contributions must successfully check and build with HEMTT before they can
be integrated. The VS Code Arma Dev Extension method below is still technically
possible, but deprecated. Using VS Code as an editor is recommended along with the [HEMTT VS Code Extension](https://marketplace.visualstudio.com/items?itemName=BrettMayson.hemtt).

### First time setup

* Install HEMTT following the [installation instructions](https://hemtt.dev/installation/).
  On Windows, use `winget install hemtt`.
* CI uses **HEMTT 1.23.1**. Use the same version to reproduce its diagnostics;
  versioned downloads are available on the [HEMTT releases page](https://github.com/BrettMayson/HEMTT/releases/tag/v1.23.1).
  Check your installed version with `hemtt --version`.
* Install [PowerShell 7](https://learn.microsoft.com/powershell/scripting/install/installing-powershell)
  to use the baseline comparison wrapper (Windows PowerShell 5.1 is not supported).
* Run HEMTT commands from the repository's `A3A` directory, which contains
  `.hemtt/project.toml`, not the repository root.
* The BI headers must be available in `A3A\include\a3\ui_f\hpp`:
  `definecommoncolors.inc`, `definedikcodes.inc`, and `defineResinclDesign.inc`.
  Keep their directory structure intact in local and CI checkouts.

### Checking contributions

From the repository root, run:

```powershell
pwsh -File .\Tools\hemtt-check.ps1
```

The wrapper runs `hemtt check --no-color` inside `A3A` and compares diagnostics
against the checked-in `A3A\.hemtt\baseline.txt` baseline from `unstable`. The baseline
temporarily allows existing HR Garage diagnostics and the existing core L-S29
warning while upstream licensing and compatibility work is pending. It does
**not** exclude the garage addon or suppress entire lint codes: new occurrences
are reported, including new garage warnings.

The comparison ignores ANSI colors, terminal gutter encoding, line-number
shifts, and diagnostic ordering. It matches severity, code, message, file paths,
columns, source excerpts, and occurrence counts. Errors and nonzero HEMTT exits
fail the check; new warnings and lower-severity `help` diagnostics are advisory.
The complete output and JSON comparison are saved under
`A3A\.hemttout\baseline-check`.

Pull requests are checked automatically by the `HEMTT check` workflow on
opening, updating, reopening, and becoming ready for review. It runs the same
wrapper and posts its output as a review comment, including on pull requests
from forks. The comment lists any new warnings, or states that no new warnings
or errors were introduced. Warning-only runs pass; new errors fail the workflow
and must be fixed before merging. The output is also shown on the workflow
run's summary page.

The workflow uses `pull_request_target`, so GitHub runs the version of the
workflow, wrapper, and baseline on the pull request's **target** branch. Changes
to these files in a pull request only take effect after they are merged.

The workflow is not run against pull requests with the `infrastructure`, `documentation`, and / or `not-now` labels.

### Building and releasing

From the repository root:

```powershell
Set-Location .\A3A
hemtt check
hemtt build
```

`hemtt build` creates the local test build in `A3A\.hemttout\build`.
For faster local testing without binarization, use `hemtt build --no-bin`.
For live editing and launching, see [hemtt dev](https://hemtt.dev/commands/dev.html)
and [hemtt launch](https://hemtt.dev/commands/launch.html).
On Windows, install Arma 3 Tools for builds that require BI binarization tools.

To produce a release, run from `A3A`:

```powershell
hemtt release
```

HEMTT creates the release build in `A3A\.hemttout\release`, signs the PBOs and
creates a key, and writes ZIP archives in `A3A\releases`. Public releases should
remain signed. See [hemtt release](https://hemtt.dev/commands/release.html) for
release options.

## With VS Code Arma Dev Extension (deprecated)
### First time setup
* Install extension from [marketplace](https://marketplace.visualstudio.com/items?itemName=ole1986.arma-dev)
* configure the extension from the Antistasi workspace by opening the command pallet <kbd>Ctrl</kbd>/<kbd>⌘</kbd> + <kbd>P</kbd> and running the `Arma 3: configure` command
* fill in the configuration `.json` file something like this
```json
{
	"title": "Antistasi Ultimate",
	"name": "A3U",
	"author": "Antistasi Ultimate Dev Team",
	"website": "https://antistasiultimate.com/",
	"version": "13.0.0",
	"buildPath": "build",
	"privateKey": "", //add the path to a private bikey for signing when building
	"serverDirs": [],
	"serverUse32bit": false,
	"clientDirs": [ //should list all addons the mod provides
        "A3A/addons/bazaar",
        "A3A/addons/config_fixes",
        "A3A/addons/core",
        "A3A/addons/events",
        "A3A/addons/garage",
        "A3A/addons/gui",
        "A3A/addons/hals",
        "A3A/addons/jeroen_arsenal",
        "A3A/addons/logistics",
        "A3A/addons/main_menu",
        "A3A/addons/maps",
        "A3A/addons/patcom",
        "A3A/addons/scrt",
        "A3A/addons/ultimate",
        "A3A/addons/zeus"
    ],
	"clientMods": [],
	"ftpConnection": {},
    "steamPath": "H:\\Steam" //steam installation directory, both Arma 3 and Arma 3 Tools should be in the same steam library
}
```
* Run the command `Extensions: Open Extension Folder` and navigate to `ole1986.arma-dev-0.0.20 -> out -> helpers -> runArma.js -> ln 54` and add `'-debug'` to the list
```js
let args = [
                '2', '1', '0', '-exe', 'arma3_x64.exe',
                '-mod=' + clientMods.join(';'),
                '-nosplash',
                '-world empty',
                '-skipIntro',
                '-debug'
            ];
```
* now run the `Arma 3: Build` command, this will output into your build folder with packed addons (and signed if you have a key designated)
* run the `Arma 3: Toggle code live` command this will create symlinked folders in your arma directory for filepatching, allowing "live editing" of code, by editing the source files (dosnt include anything processed by the config.cpp)
* run the `Arma 3: Run client` or `Arma 3: Run client (with logging)` command
arma should start with everything ready for you, (the logging alternate will open the rpt thats created on arma launch)

## With Arma 3 Tools
### Packing
* open `Addon Builder` from `Arma 3 Tools`
* click options
  * add to `List of files to copy directly` this line `*.p3d;*.paa;*.hpp;*.sqf`
  * click the tree dots next to `Path to project folder` and navigate to the repository's `A3A` folder
  * optionally add a path to a `.biprivatekey` for signing, this allows you to leave key verification on for dedicated server testing
* back in the main window, add a source directory, this will be in turn each addon folder in `repository -> A3A -> addons -> {folder to build}`
* and add a destination folder, this would be for example `repository -> build -> @A3A -> addons`
* ensure for testing that it dosnt binarize the files
* now to simply press build and repeat for each folder in the `A3A -> addons`

### Running
* copy the folder in your build directory to your arma 3 directory (or symbolic link it, recommended)
* in the arma 3 launcher, under the `Mods` tab click `...More` -> `Add watched folder...` -> `Add 'Arma 3' folder`, this will automatically add local mods in yuor arma directory to your mods list for easy loading

### Live editing
* for live editing you need to create this folder structure in your arma 3 directory `x\A3A\addons`, and the create symbolic links from each folder in your repositorys `A3A\addons` folder to the one in your arma directory
* next you need to go in your arma 3 launchers `Parameters` tab and under `All Parameters` section `Advanced` thick of the parameter `Enable File-Pathcing`, then under the section `Author` thick of the parameter `Debug Mode` (i recommend favoriting these two for ease of use later on)
* now when you start with the build loaded under the `Mods` tab, it will start in `Dev` mode and allow for recompilation of functions on the go either by reloading the missing or by calling the function `A3A_fnc_prepFunctions`

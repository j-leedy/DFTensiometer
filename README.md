# DFTensiometer
A MATLAB powered tensiometer app capable of determining the tension on a bicycle wheel spoke by plucking a spoke and recording the sound it makes.

**NO MATLAB REQUIRED**

This project is part of a frequency analysis project for the Quantitative Engineering Analysis 3 course at Franklin W. Olin College of Engineering.

**Created by: Joe Leedy, Mark Belanger, Peter Schnell**

## Repository Structure
This repository contains 4 folder:
* `app`: this folder is most imortant to the user and contains the executable for installing the app. **No other files or folders are needed for using the app.**

* `code`: this folder contains code used for creating the app. Some files are in the form of MATLAB Scripts (.m) and Live Scripts (.mlx) and these were used during testing for analyzing the signal of a pluck to understand the frequencies more and eventually find a filtering range. These files are not crucial to the apps function and were used just for testing. This folder also contains the MATLAB App Designer file (.mlapp) that the app interface as created with. **If you are interested in iterating on this app, the file titled `DFTensiometer_App.mlapp` will be of most interest to you, along with the dependent functions titled `tension.m` and `natural_frequency.m`. These files control the function of the app, however, the app will need to be repackaged using MATLAB Compliler if any changes are made. Modifying these files will NOT change the function of the app in the `app` folder as is.**

* `data`: this folder contains data used for the preliminary data anlysis we did to understand the signal that comes from a spoke pluck. These are used in the scripts in the `code` folder. These files are not used in the app's function.

* `figures + images`: this folder contains images of the app and various plots used for the app's website. These are not used for the app's function.

## How to Install
1. Navigate to the Code dropdown and download the zip of this repository.
2. Open the zip folder and extract the files.
3. Once extracted, navigate to the folder titled "app".
4. Open the file titled `dftensiometer_installer.exe`. This will walk you through installation of the app.

Alternatively, you can fork and clone this repo. Still navigate to `/code/dftensiometer_installer.exe` to install.

## How to Use
3 inputs are needed for this app to work:
* Sound recording of a spoke pluck
* The length, in mm, of the spoke
* The wire gauge of the spoke

![App](<figures + images\app-updated.png>)

Spoke length can be entered in the "Spoke Length" field and spoke gauge can be selected form the "Spoke Gauge" dropdown

## Inputing Sounds
The sound from a spoke pluck can either be uploaded to the app from an existing file or you can record the sound directly from the app. In either case, the sound should be of a single pluck and the recording does not need to be very long. The recording must start before the pluck and must stop only once the spoke stops producing audible sound.

### Uploading a Sound
To upload a sound file, click the "Upload Sound" button and a window will open allowing you to select the sound you want analyzed. Most sound file types should be compatible (m4a, flac, wav, etc).

### Recording a Sound
To record from the app, clikc the "Record Sound" button. The box below this button will signify when recording has starting by displaying "Recoridng..." and will turn red. Click the "Record Sound" button again to stop the recording. Note: it may take a few seconds before the recording stops. When the recording does stop, the box will display "Done!" and will turn green.

## Calculating a Tension Value
Once a sound file, spoke length, and spoke gauge has been input into the app, click the "Calculate" button and the app will estimate the tension on the spoke in units kg-F.

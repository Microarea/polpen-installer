# polpen-installer
Welcome to the GitDevelopmentCreator tool installation guide.

Before starting with the following steps, be sure to have a github account associated to this organization, capable to accessing private repositories
Also be sure to have valid "provisioning credentials": they'll be needed in a moment

You can install the tool by downloading the setup from the following url


[setup]([https://github.com/Microarea/polpen-installer/raw/gh-pages/Installer/setup.exe](https://raw.githubusercontent.com/Microarea/polpen-installer/gh-pages/Installer/setup.exe))

This setup is an auto-updatable clickonce application.

After the first run, you will be prompted to insert your provisioning crendentials.

![1](https://user-images.githubusercontent.com/23628484/203728119-f4936d3b-e09c-4d74-a37f-001131be3173.PNG)

After the credentials validation, the GitDevelopmentCreator will proceed to check (and install if needed) for some basic requirements.
For the complete list of prerequisites, check the following [link]https://zucchettioffice365.sharepoint.com/sites/MagoCloudComunicazioni/SitePages/Development-Environment-Installation.aspx

![3](https://user-images.githubusercontent.com/23628484/203728133-b8cf1c9c-9de9-494a-8846-0a5506f64798.PNG)

Now GitDevelopmentCreator is ready to use and you should see something like that:

![4](https://user-images.githubusercontent.com/23628484/203728144-9e393acb-bc15-477c-91b4-2c2d726a5f9f.PNG)

Prior to the creation of your first "Mago" workspace, you'll need to click on the button "GIT" in the top toolbar.
The following window will appear

![8](https://user-images.githubusercontent.com/23628484/203751070-8ee1356b-3419-4b33-91a0-92b9e05f8187.PNG)

Now you have to follow this three steps: 
1) click on "Go to Github Personal Access token page": 
   this button will open your default browser and you shoud see somethink like this (insert your github user and password if requested)

![9](https://user-images.githubusercontent.com/23628484/203752246-77ab04f1-98b2-4359-ba1b-f6c074212c96.PNG)

Just click on the "Generate new token" button (classic)
   
![10](https://user-images.githubusercontent.com/23628484/203752752-701fcb9c-30f5-4af5-af68-6d2ba50c7240.PNG)

In this page you need to choose an arbitrary "name" for your token, the desired expiration date up to 90 days or even "no expiration", then proceed to  "check" the "repo", "workflow", "write:packages", "gist", "notifications", "user" and "project" sections.

Then click on the "Generate token" button at the bottom of the page: the new token will be generated.
Make sure to "copy" this token, it will be needed in a few steps.

2) Now click on the button "Update Gitscm": a command line window will be opened during the updates, just wait until the installation is completed
3) CLick on "Clear credentials and prompt for credentials": the following window should appear

 ![11](https://user-images.githubusercontent.com/23628484/203757141-83483b35-ad62-4c07-86c3-1eecbe59d4c6.PNG)

Select the "Token" section and "paste" your previously saved personal access token

That's it, you are now ready to create your first workspace.

![5](https://user-images.githubusercontent.com/23628484/203728151-f32e6447-04e3-4b4f-90ab-e953aed7d516.PNG)

In the top left section of the toolbar, click on the "Workspaces" button and then on the "New Workspace" button
In this window you need to specify a path where the workspace will be installed (e.g: C:\Develop_Test) and check wheter this repo should be a cloud or repo workspace

![6](https://user-images.githubusercontent.com/23628484/203728153-a71e7ba0-342a-4090-8ce0-015c1983a551.PNG)

Based on the cloud/desktop selection, you will now see the minimum selection of repos needed for the environment
The already selected repos are mandatory for the desired type of workspace

![7](https://user-images.githubusercontent.com/23628484/203728160-a67b52a5-dac2-4dd8-919d-2d847b846410.PNG)

You just need to add all the additioan desired repos (e.g: ERP, MDC, etc) and select the desired branch for every repo (default "Develop)
You can either change the desired repo by writing the repo name in the textbox, or by clicking on the "Select Branch" options in the dropdown button related to desired repo and selecting the branch from the list that will appear.

(if you forget to clone some repos during the "clone and build" phase, you can later add a new repo by clicking on the "Clone Repository" option in the dropdown menu for the desired repo)

![14](https://user-images.githubusercontent.com/23628484/203764119-ae8c4973-fa12-49d8-be69-497b220ba279.png)

(For cloud workspaces, my suggestion is to also check the repos "DBCreationDlls-SqlServer" and "DBCreationDlls-postgresr", this will speed up the "check and upgrade" of the database for your subscription)

![12](https://user-images.githubusercontent.com/23628484/203759425-749f5f13-f5c1-4c5a-8a26-db43bb2d714c.png)

Once all the desired repos are checked and the branches are selected, the last step is to press the button "Clone and Build" in the upper right side of the workspace, and patiently wait.
All the selected repos will be downloaded and initialized (this could take several minutes, based on your bandwidth), and all the legacy solutions like "Taskbuilder", "Erp" etc, will be compiled

Once the clone and build procedure is completed, your workspace will be ready to use.
From now on, every time you need to use your workspace, you'll need to use the "Sync" button in the upper right section of your workspace. This button will sync build and run all your repos.
Once the Sync procedure is completed, for "Desktop" workspaces, you should be able to launch Mago4 and the Administration Console  with the following buttons

![13](https://user-images.githubusercontent.com/23628484/203763184-916a063e-dbed-4db0-a5ac-eeb099d0f9e4.PNG)

For magocloud workspaces, once the procedure is completed, you should have severals powershell windows in your taskbar and you should be able to connect to mago cloud by opening the url "http://localhost:4200" on your browser

# Instances and subscriptions

If you want to check your current instance of magocloud, or managing your subscriptions, there are two more buttons in the toolbar of your workspace

![15](https://user-images.githubusercontent.com/23628484/203765293-eb0a0541-8010-41b9-b190-93c6f7bfe713.PNG)

The first one will open the following window

![16](https://user-images.githubusercontent.com/23628484/203765758-8df14128-5beb-4af2-9e18-adcbb194aa13.PNG)

If your instance is correctly configured, you should see a "Instance Key" value: this key represents your unique id associated to the provisioning system.
If something went wrong during the clone and build procedure, or if you did not provide the necessary credentials during te startup of the GitDevelopmentCreator, you should see something like this:

![17](https://user-images.githubusercontent.com/23628484/203766814-3030b7db-6f68-4a33-aa62-659705c58dda.PNG)

By clicking this button, you will register your workspace in the provisioning system.

The next button will instead give you access to all your subscriptions.
(This sections is exactly the same as the "DevelopmentManager" tool that you will find in every "Tbde" zip environemnt)

![18](https://user-images.githubusercontent.com/23628484/203767700-9b93583b-8cb9-4ea3-9b05-3d4033011e3f.PNG)

In this window you can add or remove new subscriptions...

![21](https://user-images.githubusercontent.com/23628484/203770469-a07e52b3-f0e8-45d8-a79c-84167d79daa7.PNG)

...upgrade the database for existing ones

![19](https://user-images.githubusercontent.com/23628484/203769852-656fd9dd-6d77-477e-ae65-64731807018e.png)

or you can selected the activated modules for your subscription
![20](https://user-images.githubusercontent.com/23628484/203770246-e8a6c960-d755-40e9-8d79-17e775f8e425.PNG)

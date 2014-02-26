# HansKindberg-Xml-Transformation
This is a solution for transforming xml-files/configuration-files on build by using the following **NuGet** functionality:

- [**Automatic import of msbuild targets and props files**](http://docs.nuget.org/docs/release-notes/nuget-2.5#Automatic_import_of_msbuild_targets_and_props_files)

## 1 HansKindberg-Xml-Transformation-On-Build
The pattern is:
- If *.Template.[fileextension] exists and *.$(Configuration).[fileextension] exists, *.Template.[fileextension] is transformed with *.$(Configuration).[fileextension] into *.[fileextension]
- If *.Template.[fileextension] exists but *.$(Configuration).[fileextension] does NOT exist, *.Template.[fileextension] is copied to *.[fileextension]

The default transformations are (see [**HansKindberg-Xml-Transformation-On-Build.props**](/HansKindberg-Xml-Transformation-On-Build/Build/HansKindberg-Xml-Transformation-On-Build.props)):

- App.Template.config / App.$(Configuration).config / App.config
- log4net.Template.config / log4net.$(Configuration).config / log4net.config
- Web.Template.config / Web.$(Configuration).config / Web.config
- Views\Web.Template.config / Views\Web.$(Configuration).config / Views\Web.config

You can change this behaviour by including/excluding items in the item-group **HansKindbergXmlTransformSource**.

### 1.1 Source control

- Do not include the *.[fileextension] in source-control.
- Include *.Template.[fileextension] and *.$(Configuration).[fileextension] in source-control.

### 1.2 Example

	<Content Include="Web.config" />
	<None Include="Web.Debug.config">
		<DependentUpon>Web.Template.config</DependentUpon>
	</None>
	<None Include="Web.Release.config">
		<DependentUpon>Web.Template.config</DependentUpon>
	</None>
	<None Include="Web.Template.config">
		<DependentUpon>Web.config</DependentUpon>
	</None>

## 2 HansKindberg-Xml-Transformation-Build-Files
[**1 HansKindberg-Xml-Transformation-On-Build**](#1-hanskindberg-xml-transformation-on-build) as content. I have laborated with referencing multiple **NuGet-Build**-packages in a Visual Studio project and have experienced problems when referencing. So if you want to include other **NuGet-Build** functionality together with **HansKindberg-Xml-Transformation-On-Build** the idea is to transform **HansKindberg-Xml-Transformation-Build-Files** into the package.
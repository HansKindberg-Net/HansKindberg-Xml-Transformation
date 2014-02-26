param($rootPath, $toolsPath, $package, $project)

# Try to delete HansKindberg-Xml-Transformation-Build-Files-Content-Dummy.txt
if ($project) {
	$project.ProjectItems | ?{ $_.Name -eq "HansKindberg-Xml-Transformation-Build-Files-Content-Dummy.txt" } | %{ $_.Delete() }
}
# PUT THIS SCRIPT FILE IN THE WORKING FOLDER THAT ALL FILES ARE NEEDING TO BE OPENED
# OR EXECUTED

#Gets name of this current script to prevent recursion loop
$scriptPathArray = ($MyInvocation.MyCommand).Definition.Split("\")
$name = $scriptPathArray[$scriptPathArray.Length - 1]

$dir = $PSScriptRoot # Parent Dir of all files inside you want opened up
$files = Get-ChildItem $dir -Name


#opens files in current directory until end of directory
for ($i=0; $i -lt $files.Count; $i++) {

    #Test to make sure recurtion doesn't happen causing infinate loop
    if ($files[$i] -ne $name){

        $out = $dir.ToString() + '\' + $files[$i].ToString()
        ii $out #opens file
    }
}
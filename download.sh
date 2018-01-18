# Start of Microsoft Office Configuration
URL=officecdn.microsoft.com.edgesuite.net/pr
ID=ea4a4090-de26-49d7-93c1-91bff9e53fc3 # Channel : Dogfood_O16ProPlus-O15Visio_DevMain
VERSION=$(curl tools.thecollectionbook.info/latest/?guid=$ID)
# End of Microsoft Office Configuration

# Start of Initialising configuration files

#
# launch.bat
#

echo 'reg add HKLM\SOFTWARE\Microsoft\Office\ClickToRun\Configuration /v CDNBaseUrl /d http://officecdn.microsoft.com/pr/'$ID > launch.bat
echo 'cd %~dp0 & cls' >> launch.bat
echo 'setup.exe /configure configure.xml' >> launch.bat
echo '' >> launch.bat

# End of Initialising configuration files

# Downloads the file at the root directory
wget $URL/wsus/setup.exe

# Creates the 'Office/Data' directory, enters the 'Office/Data' directory & downloads all of the required files
mkdir -p Office/Data && cd Office/Data
wget $URL/$ID/Office/Data/v64.cab
wget $URL/$ID/Office/Data/v64_$VERSION.cab

# Creates the 'Office/Data/$VERSION' directory, enters the 'Office/Data/$VERSION' directory & downloads all of the required files
mkdir $VERSION && cd $VERSION
wget $URL/$ID/Office/Data/$VERSION/stream.x64.x-none.dat
wget $URL/$ID/Office/Data/$VERSION/stream.x64.en-us.dat
wget $URL/$ID/Office/Data/$VERSION/i640.cab
wget $URL/$ID/Office/Data/$VERSION/s640.cab
wget $URL/$ID/Office/Data/$VERSION/i641033.cab
wget $URL/$ID/Office/Data/$VERSION/s641033.cab

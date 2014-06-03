alias loginuio='ssh omrindal@diamant.ifi.uio.no'
alias INF4490='cd ~/Dropbox/Felles/Emner/INF4490/'
alias INF-GEO4310='cd ~/Dropbox/Felles/Emner/INF-GEO4310/'
alias INF5700='cd ~/Dropbox/Felles/Emner/INF5700/'
alias smartski='cd ~/Dropbox/Felles/SmartSki/'
alias master='cd ~/Dropbox/Felles/Emner/Master'
alias octave_fresh='cd ~/Dropbox/Felles/SmartSki/octave_fresh/'
alias INF4480='cd ~/Dropbox/Felles/Emner/INF4480/'
alias INF5410='cd ~/Dropbox/Felles/Emner/INF5410/'
alias INF5430='cd ~/Dropbox/Felles/Emner/INF5430/'
alias INF4300='cd ~/Dropbox/Felles/Emner/INF4300/'
alias lastnedINF5430='rsync -t -avi omrindal@login.ifi.uio.no:INF5430/ ~/Dropbox/Felles/Emner/INF5430/'
alias lastoppINF5430='rsync -t -avi ~/Dropbox/Felles/Emner/INF5430 omrindal@login.ifi.uio.no:'
alias lastnedp6='rsync -t -avi omrindal@login.ifi.uio.no:INF4480/p6/ ~/Dropbox/Felles/Emner/INF4480/projects/p6/'
alias lastoppp6='rsync -t -avi ~/Dropbox/Felles/Emner/INF4480/projects/p6 omrindal@login.ifi.uio.no:INF4480/p6'
alias ml='cd ~/Dropbox/Coursera/MachineLearning/'
alias smartski-server='ssh ubuntu@smartski.zapto.org'
alias smartski-test-server='ssh ubuntu@ec2-54-218-203-217.us-west-2.compute.amazonaws.com'
alias dsb-server='ssh omrindal@oskikkanlegur.ifi.uio.no'
alias skiflex='cd ~/Dropbox/SkiFlex/'
alias eclipse='~/AndroidSDK/adt-bundle-linux-x86_64-20131030/eclipse/./eclipse'
function figsync
{
    rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/fig/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/fig/

rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/speckle_plots/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/speckle_plots/

rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/res_plot/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/res_plot/

rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/displacement/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/displacement/
rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/displacement/separateImages/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/displacement/separateImages

rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/lateral_fourier/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/lateral_fourier/
rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/beamPattern/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/beamPattern/
rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/displacement/plots/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/displacement/plots/

rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/displacement/error/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/displacement/error/

rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/displacement/final/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/displacement/final/

rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/noise/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/noise/

rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/cyst/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/cyst/

rsync -v -e ssh omrindal@login.ifi.uio.no:/projects/omrindal/FieldII/Code/AxialSpectrum/* /home/olem/Dropbox/Felles/Emner/Master/Thesis/fig_server/AxialSpectrum/
}

function converteps
{
    ls *.eps | awk '{system("epspdf --bbox "$0 )}'
}

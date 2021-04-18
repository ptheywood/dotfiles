# count lines in latex file via untex
function texCount(){
    if [ $# -gt 0 ] ; then
        untex -imo "$1" | wc -w
    else 
        echo Files required
    fi
}
# function to open the parameterised url as a google chrome app
function chromeApp(){
    if [ $# -gt 0 ] ; then
        google-chrome --app="$1"
    else
        echo URL required
    fi
}

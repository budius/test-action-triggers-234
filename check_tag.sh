GH_TAG=$1
MY_BUILD_TYPE=$2
echo "GH_TAG = $GH_TAG and MY_BUILD_TYPE = $MY_BUILD_TYPE"

TO_REMOVE="refs/tags/"
PLAIN_TAG="${${GH_TAG}/${TO_REMOVE}/}"

echo $PLAIN_TAG

# Check for release version
if [[ $GH_TAG =~ ^refs/tags/([0-9]+).([0-9]+).([0-9]+)$ ]]; then
    echo "Type Release"
    if [[ "TYPE_123" == $MY_BUILD_TYPE ]] || [[ "TYPE_ABC" == $MY_BUILD_TYPE ]]; then
        echo "continue = true"
        echo "::set-output name=CONTINUE::true"
    else
        echo "continue = false"
        echo "::set-output name=CONTINUE::false"
    fi
# Check for RC version
elif [[ $GH_TAG =~ ^refs/tags/([0-9]+).([0-9]+).([0-9]+)(-RC\.[0-9]+)$ ]]; then
    echo "Type Release Candidate"
    if [[ "TYPE_ABC" == $MY_BUILD_TYPE ]]; then
        echo "continue = true"
        echo "::set-output name=CONTINUE::true"
    else
        echo "continue = false"
        echo "::set-output name=CONTINUE::false"
    fi
# Check for sprint version
elif [[ $GH_TAG =~ ^refs/tags/([0-9]+).([0-9]+).(([0-9]+)|X)-S([0-9]+)$ ]]; then
    echo "Type Sprint"
    if [[ "TYPE_XYZ" == $MY_BUILD_TYPE ]]; then
        echo "continue = true"
        echo "::set-output name=CONTINUE::true"
    else
        echo "continue = false"
        echo "::set-output name=CONTINUE::false"
    fi
else
    echo "not allowed"
    echo "::set-output name=CONTINUE::false"
    exit 1
fi

GH_TAG=$1
MY_BUILD_TYPE=$2
echo "GH_TAG = $GH_TAG and MY_BUILD_TYPE = $MY_BUILD_TYPE"
if [[ $GH_TAG =~ ^refs/tags/([0-9]+).([0-9]+).([0-9]+)$ ]]; then
    echo "type 123 or abc"
    if [[ "TYPE_123" == $MY_BUILD_TYPE ]] || [[ "TYPE_ABC" == $MY_BUILD_TYPE ]]; then
        echo "continue = true"
        echo "::set-output name=FOO_BAR_VALUE::true"
    else
        echo "continue = false"
        echo "::set-output name=FOO_BAR_VALUE::false"
    fi
elif [[ $GH_TAG =~ ^refs/tags/([0-9]+).([0-9]+).(([0-9]+)|X)-S([0-9]+)$ ]]; then
    echo "type xyz"
    if [[ "TYPE_XYZ" == $MY_BUILD_TYPE ]]; then
        echo "continue = true"
        echo "::set-output name=FOO_BAR_VALUE::true"
    else
        echo "continue = false"
        echo "::set-output name=FOO_BAR_VALUE::false"
    fi
else
    echo "not allowed"
    echo "::set-output name=FOO_BAR_VALUE::false"
    exit 1
fi

echo "let's try"
if [[ $1 =~ ^refs/tags/([0-9]+).([0-9]+).([0-9]+)$ ]]; then
    echo "type 123 and abc"
    echo "::set-output name=TAG_BUILD_TYPES::TYPE_123,TYPE_ABC"
elif [[ $1 =~ ^refs/tags/([0-9]+).([0-9]+).(([0-9]+)|X)-S([0-9]+)$ ]]; then
    echo "type xyz"
    echo "::set-output name=TAG_BUILD_TYPES::TYPE_XYZ"
    exit 1
else
    echo "not allowed"
    echo "::set-output name=TAG_BUILD_TYPES::NO"
    exit 1
fi

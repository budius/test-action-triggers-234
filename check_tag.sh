if [[ $1 =~ ^refs/tags/([0-9]+).([0-9]+).([0-9]+)$ ]]; then
    echo ::set-output name=TAG_BUILD_TYPES::TYPE_123,TYPE_ABC
elif [[ $1 =~ ^refs/tags/([0-9]+).([0-9]+).(([0-9]+)|X)-S([0-9]+)$ ]]; then
    echo ::set-output name=TAG_BUILD_TYPES::TYPE_XYZ
else
    echo ::set-output name=TAG_BUILD_TYPES::NO
    exit 1
fi

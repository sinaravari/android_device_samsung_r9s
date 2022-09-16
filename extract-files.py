#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/samsung/exynos2100',
    'vendor/samsung/exynos2100',
]

blob_fixups: blob_fixups_user_type = {
    (
        'vendor/lib/sensors.sensorhub.so',
        'vendor/lib64/sensors.sensorhub.so',
    ): blob_fixup()
        .add_needed('libutils-v32.so'),
} # fmt: skip

module = ExtractUtilsModule(
    'r9s',
    'samsung',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'exynos2100', module.vendor
    )
    utils.run()

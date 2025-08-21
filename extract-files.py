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
    'hardware/samsung_slsi-linaro/exynos',
    'hardware/samsung_slsi-linaro/graphics',
    'vendor/samsung/exynos2100',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/lib/libexynoscamera3.so': blob_fixup()
        .add_needed('libshim_camera.so'),
    'vendor/lib64/libexynoscamera3.so': blob_fixup()
        # NOP SecCameraIPCtoRIL::enable m_sendRequest()
        .sig_replace('14 00 00 94 0A 00 00 14', '1F 20 03 D5 0A 00 00 14')
        # NOP SecCameraIPCtoRIL::disable m_sendRequest()
        .sig_replace('A8 FF FF 97 0A 00 00 14', '1F 20 03 D5 0A 00 00 14')
        # Force RAW available on all cameras
        .sig_replace(
            '28 45 97 52 00 68 68 38 C0 03 5F D6',
            '20 00 80 52 1F 20 03 D5 C0 03 5F D6'
        )
        .add_needed('libshim_camera.so'),
    (
        'vendor/lib/sensors.sensorhub.so',
        'vendor/lib64/sensors.sensorhub.so',
    ): blob_fixup()
        .add_needed('libutils-v32.so')
        .remove_needed('libhidltransport.so')
        .binary_regex_replace(b'_ZN7android6Thread3runEPKcim', b'_ZN7utils326Thread3runEPKcim'),
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

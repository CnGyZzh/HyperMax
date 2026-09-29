# Binary source manifest

HyperMax v2.2 uses two upstream binary components that are distributed in the flashable package.

| Path | Size | SHA-256 |
|---|---:|---|
| `functions/Eclipse` | 34,920 B | `3865a89c40dbac6d71a26f12aba7ec71d28f4377ee1d0cee2d88c8a125d68368` |
| `functions/miui-thermal` | 1,573,016 B | `7100bb501650bbea18921c06399dfdc633bc043cb8228d301bd5bb0367e67a36` |
| `profiles/touch/300.ini` | 18,866 B | `d5d8c9e1936fdefd5d3541478da2cce0d7d0c2aa860208e616b5f41f83906e79` |

The thermal components originate from the upstream thermal work credited in the project README.  
Do not replace these files with placeholders: HyperMax checks/uses them to generate device-specific thermal profiles.

For a flashable build, use the verified HyperMax v2.2 package until the binary blobs in this source tree match the hashes above.

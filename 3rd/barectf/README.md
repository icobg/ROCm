
## Applying the Patch for Python 3.11+ Support

Use this patch to add support for Python 3.11+.

### Steps (inside a virtual environment)

1. Download **barectf 3.1.2** from GitHub.
2. Apply the patch to the source tree.
3. Build the project:

   ```bash
   python -m build
   ```

4. Install the generated wheel:
   ```bash
   pip install dist/barectf-3.1.2-py3-none-any.whl
   ```


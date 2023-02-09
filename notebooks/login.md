
::: {.cell .markdown}
### Exercise: Log in to resources

Now, we are finally ready to log in to our resources over SSH! Run the following cells, and observe the table output - you will see an SSH command for each of the nodes in your topology.

:::

<!-- ::: {.cell .code}
```python
# read in FABRIC config - in case you pause and pick this up later
from fabrictestbed_extensions.fablib.fablib import FablibManager as fablib_manager
fablib = fablib_manager() 
!chmod 600 /home/fabric/work/fabric_config/fabric_bastion_key
!chmod 600 /home/fabric/work/fabric_config/slice_key

import os
slice_name="hello-fabric_" + os.getenv('NB_USER')

# update information about the slice
slice = fablib.get_slice(name=slice_name)
```
:::
-->



::: {.cell .code}
```python
import pandas as pd
pd.set_option('display.max_colwidth', None)
ssh_str = 'ssh -i ' + slice.get_slice_private_key_file() + \
    ' -J ' + fablib.get_bastion_username() + '@' + fablib.get_bastion_public_addr() + \
    ' -F /home/fabric/work/fabric_config/ssh_config '
slice_info = [{'Name': n.get_name(), 'SSH command': ssh_str + n.get_username() + '@' + str(n.get_management_ip())} for n in slice.get_nodes()]
pd.DataFrame(slice_info).set_index('Name')
```
:::

::: {.cell .markdown}
Now, you can open an SSH session on any of the nodes as follows:

* in Jupyter, from the menu bar, use File > New > Terminal to open a new terminal.
* copy an SSH command from the table, and paste it into the terminal. (Note that each SSH command is a single line, even if the display wraps the text to a second line! When you copy and paste it, paste it all together.)

:::


::: {.cell .markdown}

You can repeat this process (open several terminals) to start a session on each host and the router. Each terminal session will have a tab in the Jupyter environment, so that you can easily switch between them.

:::


::: {.cell .markdown}

Try typing

```
echo "Hello world"
```

in the terminal shell *on one of your FABRIC hosts*, and observe the output.

:::
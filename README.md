Inspired by [xkcd #287](http://xkcd.com/287/).

To run (`Parser` will use `menu.txt` by default):

```shell
git clone git@github.com:wfro/xkcd.git
cd xkcd
ruby run.rb
```

You can optionally pass another file to the ruby interpreter (use absolute filepaths if the file is outside of the xkcd directory). 

```shell
ruby run.rb another_menu.txt
```

If you'd like to run tests (using Minitest):

```shell
ruby menu_solver_test.rb
```

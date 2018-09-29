# Jets Example Projects

List of example projects with [Jets](http://rubyonjets.com/). Some projects are submodules and some of them are plain subfolders. To check out the all projects locally:

    git clone https://github.com/tongueroo/jets-examples.git
    cd jets-examples
    git submodule init
    git submodule update

## Examples

* [Config Rules](https://github.com/tongueroo/jets-example-config-rules/tree/12dfa10acaffe7117790dd6e8bbc7d4bcf97f245)
* [Crud Api](https://github.com/tongueroo/jets-example-crud-api/tree/3b88932e5dce4b789fba866711e934e0228cd1de)
* [Crud Html](https://github.com/tongueroo/jets-example-crud-html/tree/5cf0d3d4958bacfc678258fa957e64c4041b7ff9)

## Adding your project

Fork the repo and create a pull request.

### Submodule

To add your project as a submodule:

    git submodule add https://github.com/username/my_project.git examples/my_project

### Subfolder

Just copy and paste your project into the repo under the `examples` folder.

### Update README

There's a command to update the readme projects list:

    rake readme:update

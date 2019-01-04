# Jets Example Projects

List of example projects with [Jets](http://rubyonjets.com/). Some projects are submodules and some of them are plain subfolders. To check out the all projects locally:

    git clone https://github.com/tongueroo/jets-examples.git
    cd jets-examples
    git submodule init
    git submodule update

## Examples

* [Backup Route53](https://github.com/tongueroo/jets-backup-route53)
* [Config Rules](https://github.com/tongueroo/jets-example-config-rules)
* [Crud Api](https://github.com/tongueroo/jets-example-crud-api)
* [Crud Html](https://github.com/tongueroo/jets-example-crud-html)
* [Demo Crud](https://github.com/tongueroo/jets-demo-crud)
* [Demo Rails](https://github.com/tongueroo/demo-rails)
* [Mega Demo](https://github.com/tongueroo/jets-mega-demo)
* [Postgresql](https://github.com/tongueroo/jets-example-postgresql)
* [Upload Images](https://github.com/tongueroo/jets-example-upload)

## Adding your project

Fork the repo and create a pull request.

### Submodule

To add your project as a submodule:

    git submodule add https://github.com/username/my_project.git examples/my_project

### Subfolder

To add your project as a subfolder, just copy and paste your project into the repo under the [examples](examples) folder.

### Update README

There's a command to update the readme projects list:

    rake readme

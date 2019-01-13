# Jets Example Projects

List of example projects with [Jets](http://rubyonjets.com/). Projects are submodules in the [examples](examples) folder. To check out the all projects locally:

    git clone https://github.com/tongueroo/jets-examples.git
    cd jets-examples
    git submodule init
    git submodule update

## Examples

* [Api](https://github.com/tongueroo/jets-example-api)
* [Backup Route53](https://github.com/tongueroo/jets-backup-route53)
* [Config Rules](https://github.com/tongueroo/jets-example-config-rules)
* [Crud Api](https://github.com/tongueroo/jets-example-crud-api)
* [Crud Html](https://github.com/tongueroo/jets-example-crud-html)
* [Demo Crud](https://github.com/tongueroo/jets-demo-crud)
* [Demo Rails Api](https://github.com/tongueroo/demo-rails-api)
* [Demo Rails](https://github.com/tongueroo/demo-rails)
* [Dynamodb](https://github.com/tongueroo/jets-dynamodb-example)
* [Mega Demo](https://github.com/tongueroo/jets-mega-demo)
* [Postgresql](https://github.com/tongueroo/jets-example-postgresql)
* [Slack Command](https://github.com/axel/jets-example-slack-command)
* [Upload Images](https://github.com/tongueroo/jets-example-upload)

## Adding your project

Fork the repo and create a pull request.

### Submodule

To add your project as a submodule:

    git submodule add https://github.com/username/my_project.git examples/my_project

### Update README

There's a command to update the readme projects list:

    rake readme

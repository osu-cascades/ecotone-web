# Contributing to Ecotone

## Contributing Code
If you have improvements to Ecotone, please send us a pull request! For those of you new to Github, here is a [how to guide](https://docs.github.com/en/github/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).

If you want to contribute, navigate to the [Github "issues" tab](https://github.com/osu-cascades/ecotone-web/issues) and check out existing issues. If you decide to start on an issue, leave a comment so that other people know that you're working on it. If you want to help out, but not alone, use the issue comment thread to coordinate work with other developers.

### General Steps
- Fork the Ecotone-Web repo.
- Set Ecotone-Web as the upstream `git remote add upstream https://github.com/osu-cascades/ecotone-web.git`
- Create a branch for your changes `git checkout -b 'branch_name'`
- Make changes on your branch.
- Ensure changes pass all existing unit tests.
- Push your branch to your remote `git push origin 'branch_name'`
- Once ready, make a Pull Request to merge your branch into Ecotone-Web ***Develop***.

### Guidelines for Code Contributions
- When contributing to new features, include unit tests. This will ensure your feature is working correctly and prevent future breaks.
- When fixing a bug, add in unit testing. The presence of a bug is usually indicative of a lack in testing coverage.
- Adhere to existing conventions in the codebase.

### Coding Style
Ruby code should conform to [Ruby style](https://ruby-style-guide.shopify.dev/). You can install the [RuboCop linter](https://rubocop.org/) to check your styling. 
`gem install rubocop`

- Running rubocop with no arguments will check all Ruby source files in the current directory:
`rubocop`
- Alternatively you can specify a list of files and directories to check:
`rubocop app spec lib/something.rb`

## Contributing Bugs/Feature Requests
If you have found a bug, or would like to request a new feature, please [submit an issue](https://github.com/osu-cascades/ecotone-web/issues).
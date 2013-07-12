# Loco

Loco counts all of the lines in all of the files in the current directory and recursively in
subdirectories. Then it tells you how many lines in how many files. Now you have a pretty
distribution graph of file sizes in your project. Loco will also show a breakdown of file
and line counts by file extension. Loco does not count blank lines, but it does count comment
files because loco is not going to try to guess all the comment formats for all of the
languages you use.

## Installation

    $ gem install loco

## Usage

    $ loco

will produce something like this:

    ### extensions ###
       .rb -      791 files,    25907 lines
     .haml -      391 files,     6938 lines
      .yml -      173 files,     7512 lines
     .rake -        8 files,      383 lines
     .html -        4 files,      179 lines
       .js -       14 files,      840 lines

    ### longest files ###
       145 public/javascripts/validations.js
       145 spec/models/invoice_spec.rb
       144 app/models/widget/stage.rb
       144 app/models/invoice.rb
       144 app/models/widget/address_extractor.rb
       143 spec/models/invoice_presenter_spec.rb
       143 app/helpers/html_helper.rb
       141 config/routes.rb
       141 app/controllers/people/people_controller.rb
       138 spec/models/person_spec.rb
       138 spec/models/xaction_spec.rb
       137 app/controllers/welcome_controller.rb
       135 app/views/invoices/show.html.haml
       132 spec/support/factory.rb
       131 app/models/person.rb
       129 public/javascripts/application.js

    ### distribution ###
         0 lines       10 **********
         1 lines       13 *************
         5 lines       29 *****************************
         6 lines       44 ********************************************
        10 lines       55 **********************************************************
        11 lines       33 *********************************
        15 lines       27 ***************************
        16 lines       27 ***************************
        20 lines       35 *************************
        21 lines       29 ********************
        25 lines       16 ****************
        26 lines       15 ***************
        30 lines       15 ***************
        31 lines       16 ****************
        35 lines       12 ************
        36 lines       13 *************
        40 lines        9 *********
        41 lines       11 ***********
        45 lines        9 *********
        46 lines       11 ***********
        50 lines        5 *****
        51 lines        8 ********
        52 lines        2 **
        53 lines        8 ********
        54 lines        9 *********
        55 lines        4 ****
        56 lines        5 *****
        69 lines        3 ***
        71 lines        1 *
        80 lines        2 **
        95 lines        1 *
       128 lines        1 *


You can also run any of :

    $ loco js
    # => shows stats for .js files in your project

    $ loco rb
    # => shows stats for .rb files in your project

    $ loco haml
    # => shows stats for .haml files in your project

    $ loco views
    # => shows stats for files in your project under app/views/

    $ loco spec
    # => shows stats for files in your project under spec/

    $ loco empty
    # => shows stats for empty files in your project (same as loco size 0)

    $ loco size 8
    # => shows stats for project files that are 8 lines long


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

Loco is released under the MIT license.

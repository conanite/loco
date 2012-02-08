
  rake loco

will produce something like this:

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

  ### extensions ###
     .rb -      791 files,    25907 lines
   .haml -      391 files,     6938 lines
    .yml -      173 files,     7512 lines
   .rake -        8 files,      383 lines
   .html -        4 files,      179 lines
     .js -       14 files,      840 lines

== License

Loco is released under the MIT license.

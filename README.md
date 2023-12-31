# Slcsp
## Calculate the second lowest cost silver plan

## setup
--You may need to provide permission to the executable
```ruby
sudo chmod 755 'bin/slcsp'
```
-- check gemspec for version details and dependancies. 
-- you may have to run bundle install

## usage
Simply run
```ruby
bin/slcsp
```

## Dev Notes
-- reduce memory footprint by only recording zipcodes defined in slcsp.csv
-- main entry point is cli.rb 
-- *_data files manage reading and parsing data from files
-- datum.rb - manages an instance of a zip code to rates
-- reader - simple csv wrapper
-- storable - common class for data management classes
-- log - wraps std_out actions, not necessary, but good for debugging 

## Approach
-- read in targetd zip codes from slcsp.csv
-- generate reference dictionary for zips file to plans data file on rate_area scoped only to zip codes found in slcsp.csv
-- aggregate rates to zip code
  -- * note some rates will be applied to multiple zip codes in the event multiple zip codes are associated to a single rate_area
-- find second least rate in zip code by droping the min value in zip rate aggregate (deletes all references of like values, no need to check if min value has one or more values)
Example
```ruby
 zipcode = {'466345' => [1,4,2,1,1,5]}
 zipcode = {'466345' => [4,2,5]} # after removing min value
 slcsp = 2 # get min value a second time 
```

## Problem

You've been asked to determine the second lowest cost silver plan (SLCSP) for
a group of ZIP codes.

## Task

You've been given a CSV file, `slcsp.csv`, which contains the ZIP codes in the
first column. Fill in the second column with the rate (see below) of the
corresponding SLCSP and emit the answer on `stdout` using the same CSV format as
the input. Write your code in your best programming language.

### Expected output

The order of the rows in your answer as emitted on stdout must stay the same as how they
appeared in the original `slcsp.csv`. The first row should be the column headers: `zipcode,rate`
The remaining lines should output unquoted values with two digits after the decimal
place of the rates, for example: `64148,245.20`.

It may not be possible to determine a SLCSP for every ZIP code given; for example, if there is only one silver plan available, there is no _second_ lowest cost plan. Check for cases where a definitive answer cannot be found and leave those cells blank in the output (no quotes or zeroes or other text). For example, `40813,`.

## Additional information

The SLCSP is the so-called "benchmark" health plan in a particular area. It's
used to compute the tax credit that qualifying individuals and families receive
on the marketplace. It's the second lowest rate for a silver plan in the rate area.

For example, if a rate area had silver plans with rates of `[197.3, 197.3, 201.1, 305.4, 306.7, 411.24]`, the SLCSP for that rate area would be `201.1`,
since it's the second lowest rate in that rate area.

A plan has a "metal level", which can be either Bronze, Silver, Gold, Platinum,
or Catastrophic. The metal level is indicative of the level of coverage the plan
provides.

A plan has a "rate", which is the amount that a consumer pays as a monthly
premium, in dollars.

A plan has a "rate area", which is a geographic region in a state that
determines the plan's rate. A rate area is a tuple of a state and a number, for
example, NY 1, IL 14.

There are two additional CSV files in this directory besides `slcsp.csv`:

- `plans.csv` — all the health plans in the U.S. on the marketplace
- `zips.csv` — a mapping of ZIP code to county/counties & rate area(s)

A ZIP code can potentially be in more than one county. If the county can not be
determined definitively by the ZIP code, it may still be possible to determine
the rate area for that ZIP code. A ZIP code can also be in more than one rate area. In that case, the answer is ambiguous
and should be left blank.
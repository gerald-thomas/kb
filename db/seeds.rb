# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1=Rule.create(name: 'Schedule change exists?', excel: 'excelFile1.xls', test: 'IF(NOT(ISNA(MATCH("SC",ADDRESS(ROW(action_cd)+1,COLUMN(action_cd),1)&":"&ADDRESS(ROW(action_cd)+10,COLUMN(action_cd),1),0))),TRUE,FALSE)', branch: 1)

r2=r1.children.create :name => 'Schedule change exists-Yes', :branch=>1
r3=r1.children.create :name => 'Schedule change exists-No', :excel=>'excelFile3.xls', :test=>'IF(NOT(ISNA(MATCH("SC",ADDRESS(ROW(action_cd)+1,COLUMN(action_cd),1)&":"&ADDRESS(ROW(action_cd)+10,COLUMN(action_cd),1),0))),TRUE,FALSE)', :branch=>0
r4=r3.children.create :name => 'FrequentFlyer-Yes', :branch=>1
r5=r3.children.create :name => 'FrequentFlyer-No', :excel=>'excelFile5.xls', :test=>'IF(NOT(ISNA(MATCH("SC",ADDRESS(ROW(action_cd)+1,COLUMN(action_cd),1)&":"&ADDRESS(ROW(action_cd)+10,COLUMN(action_cd),1),0))),TRUE,FALSE)', :branch=>0
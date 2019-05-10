# ჩვენი მიზანია გავიგოთ, კვირის რომელი დღეები და საათები (ერთ საათიანი დიაპაზონებით) არის გამარჯვებული.
# ანუ გვესმოდეს რომელ დღეებში და საათებში ხდება ყველაზე მეტი და ნაკლები შემოწირულობები.

# 1. ორშაბათიდან კვირის ჩათვლით ყოველ დღეს მივანიჭოთ რეიტინგი.
# მაგალითად პირველ კვირაში ტრანზაქციების რაოდენობით მოიგო ორშაბათმა (და მივანიჭოთ 7 ქულა - 7 დღეა კვირაში;),
# მეორეზე სამშაბათი გავიდა და მივანიჭოთ 6 დ.ა.შ და მერე ყველა კვირების ორშაბათები შევაჯამოთ,
# სამშაბათები დ.ა.შ და გავიგებთ რეიტინგს რომელია გამარჯვებული დღე, მეორე ადგილი, მესამე დ.ა.შ 

# 2. აქ გვინდა 7 დღის ანალიზი (კვირის დღეები) ცალ-ცალკე. სადაც პირველი მაგალითად ორშაბათი და ეს ორშაბათი
# ჩაშლილია საათების რეინჯებად: 8-9 მდე, 9-10, 10-11 და ასე ღამის 2-3 საათამდე. აქაც გვინდა საათების
# დიაპაზონის/რეინჯის რეიტინგი. რამდენი რეინჯიც არის იმდენი ქულაა მაქსიმალური და ყველაზე მეტი ტრანზაქცია
# რომელ რეინჯშიც არის იმას მაქსიმალური ქულა და მეორე ადგილზე ვინც გავა იმას ერთით დაბალი, დ.ა.შ
# და მერე ისევ ყველა ორშაბათების რეინჯების ქულებს დავაჯამებთ, მერე სამშაბათების რეინჯების ქულებს დავაჯამებთ დ.ა.შ
# ბოლოს გავიგებთ ორშაბათს რომლი საათების რენჯებია კარგი, სამშაბათ რომლები, დ.აშ.

# 3. აქ გვაინტერესებს 4 კვირა ანუ თვეში რომელი კვირებია კარგი, ანუ კვირების რეიტინგი. და აქაც იგივე ლოგიკაა.
# კვირებს რეიტინგის მიხედვით მივანიჭოთ ქულები. პირველი ადგილი 4 ქულა, მეორე 3 დ.ა.შ.
# და მერე ყველა პირველი კვირის ქულა დავაჯამოთ, მეორე კვირის დავაჯამოთ , დ.აშ და თვეში კვირების რეიტინგი მივიღოთ.
# ანუ თვის რომელი კვირებია ყველაზე აქტიური.

# მონაცემი რომელიც არ უნდა გაითვალისწინო: თვეში ერთხელ ყველა ამ ხალხს ვინც მიაბა ბარათი,
# ავტომატურად ვაჭრით ბარათიდან ფულს ამიტომ ეგ ტრანზაქციები (ავტომატური ჩამოჭრის) არ არის გასათვალისწინებელი.
# ამ ტრანზაქციების გარჩევა მარტივია, ერთ რომელიმე დღეს (თვის დასაწყისში 1 ში ან 5 ში - თავიდან 5 იყო და მერე შევცვალეთ)
# ყველას ერთი და იგივე დროს ეჭრება თანხა. ანუ ეგ ტრანზაქციები რომ არ გაითვალისწინო.
# ანუ ერთი და იგივე საათზე განხორციელებული ტრანქციები არ გვინდა, მაგრამ იმავე დღეს ვთქვათ 1 რიცხვში შეიძლება იყოს სხვა
# დროს შესრულებული ტრანზაქცია, ანუ მომხმარებელმა დამოუკიდებლად მიაბა ბარათი და ეგ უკვე გვაინტერესებს რომ იყოს გათვალისწინებული.

# პუნქტი სადაც ვიძახით რა არ უნდა იყოს გათვალისწინებული იქ მინდა დავამატო ასევე რომ ჩვენ ავტომატურ ჩამოჭრებს კი
# ვაკეთებთ თვეში ერთხელ (დღეს 1 ში და ადრე 5 რიცხვში) მაგრამ მაგის გარდა კიდე იმას ვისაც იმ მომენტში არ მოეჭრა
# ვაგრძელებთ ჩამოჭრის მცდელობას კიდევ 10 დღის განმავლობაში იმათაც იგივე საათზე (ადრე საღმოს 11 საათი იყო და ეხლა საღამოს 7 საათია)
# ხოდა ვინაიდან ეგენიც ავტომატური ჩამოჭრებია მაგათი გათვალისწინებაც არ გვინდა. გათვალისწინება გვინდა მხოლოდ ტრანზაქციების
# რომლებიც არა-ავტომატურია და დონორის მიერ არის განხორციელებული.

require "rubyXL" # "3.3.29" # Assuming rubygems is already required
require "date"

class Date
  def weekday_name
     DAYNAMES[self.wday]
  end

  # def days_in_month
  #   case self.month
  #   when 4,6,9,11
  #     30
  #   when 2
  #     (self.year % 4 == 0 && self.year % 100 != 0 || self.year % 400 == 0) ? 29 : 28
  #   else
  #     31
  #   end
  # end
end

FILE_NAME = ARGV[0]
workbook_path = "#{Dir.home}/Desktop/#{FILE_NAME}"
unless File.file?(workbook_path)
  puts "File name or path incorrect: #{workbook_path}"
  return 1
end

workbook = RubyXL::Parser.parse(workbook_path)
days_of_the_week_ratings = Date::DAYNAMES.map { |d| [d, 0] }.to_h
days_of_the_week_hourly_ratings = Date::DAYNAMES.map { |d|
  [d, (0..23).map { |x| [x, 0] }.to_h]
}.to_h
week_of_the_month_ratings = (1..5).map { |v| [v, 0] }.to_h

row_counter = 0
previous_payment_time = nil

worksheet = workbook[0]
worksheet.each_with_index do |row|
  last_row_index = row.cells.last.row
  next if last_row_index.zero?

  next if row[3].value.eql?("Giorgi Jibla")

  date = begin
           DateTime.strptime("#{row[0].value} +0400", "%m/%d/%Y %H:%M:%S %p %z")
         rescue ArgumentError
           next
         end

  if date.day.eql?(1) && date.hour.eql?(19) && date.minute.eql?(0)
    next
  elsif date.day.eql?(5) && date.hour.eql?(19) && date.minute.eql?(0)
    next
  elsif date.day.eql?(5) && date.hour.eql?(23) && date.minute.eql?(0)
    next
  elsif previous_payment_time.eql?(date)
    worksheet.delete_cell(last_row_index - 1, 3)
    worksheet.change_row_fill(last_row_index - 1, "ffffff")
    next
  else

    days_of_the_week_ratings[date.weekday_name] += 1

    days_of_the_week_hourly_ratings[date.weekday_name][date.hour] += 1
    week_of_the_month_ratings[(date.day / 7.0).ceil] += 1

    # worksheet.add_cell(last_row_index, 3, "✓")
    worksheet.change_row_fill(last_row_index, "f5dc28")
    row_counter += 1
  end

  previous_payment_time = date
end

workbook.write(workbook_path)

puts "\nსულ შეფასდა #{row_counter} ტრანზაქცია\n"

puts "\n************************"
puts "რეიტინგი კვირის დღეების მიხედვით:"
pp   days_of_the_week_ratings
puts "************************\n"

puts "\n************************"
puts "რეიტინგი კვირის დღის და საათის მიხედვით:"
pp   days_of_the_week_hourly_ratings
puts "************************\n"

puts "\n************************"
puts "რეიტინგი კვირების მიხედვით:"
pp   week_of_the_month_ratings
puts "************************\n"

worksheet = workbook[1]
worksheet.each_with_index do |row|
  if row[0] && days_of_the_week_ratings.has_key?(row[0].value)
    worksheet[row.cells.last.row][1].change_contents(
      days_of_the_week_ratings[row[0].value]
    )
  end

  if row[3] && week_of_the_month_ratings.has_key?(row[3].value)
    worksheet[row.cells.last.row][4].change_contents(
      week_of_the_month_ratings[row[3].value]
    )
  end
end

worksheet[0].cells.each do |cell|
  if cell && Date::DAYNAMES.include?(cell.value) && !cell.column.eql?(0)
    (0..23).each do |index|
      worksheet[index + 1][cell.column].change_contents(
        days_of_the_week_hourly_ratings[cell.value][index]
      )
    end
  end
end

workbook.write(workbook_path)

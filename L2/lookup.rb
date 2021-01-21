# Sample Output:

# $ ruby lookup.rb google.com
# google.com => 172.217.163.46

# $ ruby lookup.rb gmail.com
# gmail.com => mail.google.com => google.com => 172.217.163.46

# $ ruby lookup.rb gmil.com
# Error: record not found for gmil.com

def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

dns_raw.filter! { |line| !(line == "" or line == "\n" or line[0] == "#") }

def parse_dns(dns)
  dns_records = {}
  dns.map do |line|
    col = line.split(",").map { |column| column.strip }
    dns_records[col[1]] = [col[0], col[2]]
  end
  dns_records
end

def resolve(dns_records, lookup_chain, domain)
  if dns_records.key?(domain)
    val = dns_records[domain]
    lookup_chain.push(val[1])
    if val[0] != "A"
      resolve(dns_records, lookup_chain, val[1])
    end
    lookup_chain
  else
    lookup_chain = ["Error: record not found for #{domain}"]
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")

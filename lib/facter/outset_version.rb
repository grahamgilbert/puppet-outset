#outset_version.rb
Facter.add(:outset_version) do
  confine :kernel => "Darwin"
  setcode do
    out = ''
    if File.exist?('/usr/local/outset/outset')
        File.open('/usr/local/outset/outset') do |file|
            file.each_line do |line|
              if line.start_with?('__version__')
                  out = line.chomp().sub('__version__ = ', '')
                  out[0]=''
                  out = out.chomp("'")
                  break
              end
            end
          out
      end
    else
        "Outset not installed"
    end
  end
end

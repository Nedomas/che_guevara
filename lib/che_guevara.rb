require "che_guevara/version"

module CheGuevara
  class Soldier
    def self.work
      history = File.read(File.join(Dir.home, '.zsh_history'))

      # fix encoding
      history.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')

      # format
      commands = history.split(/\n/).map { |line| line.split(/;/) }.map { |_, command| command }

      counts = commands.group_by{|i| i}.map{|k,v| [k, v.count] }
      commands_map = Hash[*counts.flatten]

      ineffective_commands = commands_map
        .reject { |k, v| v < 10 }
        .select { |k, v| k && k.size > 5 }
        .reject { |k, v| k && k.match(/feature/) }
        .sort_by { |k, v| v }

      ineffective_commands.each do |command, reps|
        puts "#{reps}: #{command}"
      end
    end
  end
end

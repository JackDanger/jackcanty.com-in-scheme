
# jackcanty.com
God.watch do |w|
  dir = File.dirname(File.basename(__FILE__)) 
  w.name = "jackcanty"
  w.interval = 30.seconds
  w.start = "#{dir}/app -e production -d"
  w.uid = 'www'
  w.gid = 'www'
  w.start_if do |start|
    start.condition(:process_running) do |c|
      c.interval = 5.seconds
      c.running = false
    end
  end
end

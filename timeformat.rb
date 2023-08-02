class TimeFormat
  TIME_FORMATS = { 'year' => '%Y',
                   'month' => '%m',
                   'day' => '%d',
                   'hour' => '%Hh',
                   'minute' => '%Mm',
                   'second' => '%Ss' }.freeze

     
    attr_reader: correct, incorrect

  def initialize(params)
    @correct = ''
    @incorrect = []
    @params = params['format'].split(',')
  end

  def check_time_response
    @params.each { |format| TIME_FORMATS[format] ? @correct += TIME_FORMATS[format] : @incorrect << format }
  end
end

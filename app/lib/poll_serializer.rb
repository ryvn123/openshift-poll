class PollSerializer
  class << self
    def count_per_month poll
      replies = poll.replies.group_by { |reply| reply.created_at.beginning_of_month }

      data = replies.map { |key, values| values.length }

      {
        data: data,
        title: "Number of collected Polls by month",
        x_axis: {
          legend: "Polls per month",
          series: replies.keys.map { |date| date.strftime("%b %Y") },
          color: replies.keys.map { |a| 'blue' }
        },
        y_axis: {
          legend: "No. polls",
          scale: [0, (data.max or 0) + 1]
        }
      }
    end

    def answers_per_question question
      answers_per_question = question.answers.group_by(&:possible_answer).sort
      data = answers_per_question.map { |possible_answer, answers| answers.length }
      series = answers_per_question.map { |possible_answer, answers| possible_answer.nil? ? 'No Answer' : possible_answer.try(:title) }
      colors = answers_per_question.map { |possible_answer, answers| (possible_answer.nil? ? '#d9534f' : possible_answer.check? ? 'grey' : '#d9534f')  }
      {
        data: data,
        title: 'Qn: ' + question.title,
        x_axis: {
          legend: "Replies",
          series: series,
          color: colors
        },
        y_axis: {
          legend: "No. polls",
          scale: [0, (data.max or 0) + 1]
        }
      }
    end
  end
end

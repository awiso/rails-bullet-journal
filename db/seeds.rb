journals = ["My Super Journal", "Other Journal"]

journals.each do |j|
  new_j = Journal.new(title: j)
  new_j.save
end

journals = Journal.all

content = [
  {
    content:    "meeting with John",
    scope:      "daily",
    done:       false,
    entry_type: "event"
  },
  {
    content:    "pay rent",
    scope:      "monthly",
    done:       false,
    entry_type: "task"
  },
  {
    content:    "record podcast with Tom",
    scope:      "daily",
    done:       false,
    entry_type: "event"
  },
  {
    content:    "Salsa dancing with Santi",
    scope:      "monthly",
    done:       false,
    entry_type: "event"
  },
  {
    content:    "I dreamt about apples",
    scope:      "daily",
    done:       false,
    entry_type: "note"
  },
  {
    content:    "Get a job",
    scope:      "future",
    done:       false,
    entry_type: "event"
  }
]

content.each do |c|
  entry = Entry.new(c)
  entry.journal = journals.first
  entry.save!
end

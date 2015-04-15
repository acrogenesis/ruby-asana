### WARNING: This file is auto-generated by the asana-api-meta repo. Do not
### edit it manually.

module Asana
  module Resources
    # An _attachment_ object represents any file attached to a task in Asana,
    # whether it's an uploaded file or one associated via a third-party service
    # such as Dropbox or Google Drive.
    class Attachment < Resource

      attr_reader :id

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'attachments'
        end

        # Returns the full record for a single attachment.
        #
        # id - [Id] Globally unique identifier for the attachment.
        def find_by_id(client, id)

          new(body(client.get("/attachments/#{id}")), client: client)
        end

        # Returns the compact records for all attachments on the task.
        #
        # task - [Id] Globally unique identifier for the task.
        def find_by_task(client, task:)

          Collection.new(body(client.get("/tasks/#{task}/attachments")).map { |data| new(data, client: client) }, client: client)
        end

        # Returns the compact records for all attachments on the task.
        #
        # data - [Hash] the attributes to post.
        # task - [Id] Globally unique identifier for the task.
        #
        # file - [File] TBD
        def create_on_task(client, task:, file:, **data)
          with_params = data.merge(file: file).reject { |_,v| v.nil? }
          new(body(client.post("/tasks/#{task}/attachments", body: with_params)), client: client)
        end
      end

    end
  end
end

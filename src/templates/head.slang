  head
    meta name="viewport" content="width=device-width,initial-scale=1.0"
    title This is a title
    css:
      .entry,
      .header,
      .query,
      .cookie,
      .request,
      .response
      {
        border: 1px solid black;
        padding: 10px;
        margin: 10px 0;
        border-radius: 4px;
      }
      pre {
        white-space: pre-wrap;
      }
      h3 {
        font-size: 2em;
        text-decoration: underline;
        margin: 0;
      }

      .comment {
        color: #333;
      }

      .meta .name,
      .header .name,
      .general .name,
      .content .name,
      .query .name {
        display: inline-block;
        font-size: 1.1em;
      }

      .meta .name::after,
      .header .name::after,
      .general .name::after,
      .content .name::after,
      .query .name::after {
        content: ": "
      }

      .meta .value,
      .header .value,
      .general .value,
      .content .value,
      .query .value {
        display: inline-block;
        color: #333;
      }

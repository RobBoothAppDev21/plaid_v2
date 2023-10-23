import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"
import { jQuery } from "jquery"

// Connects to data-controller="plaid-link"
export default class extends Controller {

  connect() {
    (async ($) => {
      const createLinkToken = async () => {
        const req = new FetchRequest("get", "/plaid/link_token")
        const res = await req.perform()
        if (res.ok) {
          const linkToken = await res.text
          localStorage.setItem("link_token", linkToken);
          return linkToken
        }
      };

      const handler = Plaid.create({
        token: await createLinkToken(),
        onSuccess: async(publicToken, metadata) => {
          const req = new FetchRequest("post", "/plaid/public_token_exchange", {
            body: {
              public_token: publicToken,
            },
            contentType: "application/json"
          })
          const res = await req.perform()
          if (res.ok) {
            const itemExchangeResponse = await res.text
            // console.log(itemExchangeResponse)
            // console.log(metadata)
            const createItemRequest = new FetchRequest("post", '/items', {
              body: { 
                item_exchange_response: itemExchangeResponse, 
                metadata: metadata, 
              },
              contentType: "application/json",
            })
            const createItemResponse = await createItemRequest.perform()
          }
          // });
          await getBalance()
          // await getTransactions()
        },
        onEvent: (eventName, metadata) => {
          console.log("Event:", eventName)
          console.log("Metadata", metadata)
        },
        onExit: (error, metadata) => {
          console.log(error, metadata)
        },
      })

      const linkAccountButton = document.getElementById("link-account")
      linkAccountButton.addEventListener("click", (event) => {
        handler.open()
      })
    })(jQuery)

    const getBalance = async function () {
      const response = new FetchRequest("post", "/accounts", {
        body: {},
        contentType: "application/json"
      })
      const req = await response.perform()
    }

  }
}

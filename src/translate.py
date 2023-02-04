import json
import decimalencoder
import todoList


def translate(event, context):
    # create a response
    item = todoList.get_item(event['pathParameters']['id'])
    translate = todoList.get_translate(
        item['text'], event['pathParameters']['lang']
    )

    if translate:
        response = {
            "statusCode": 200,
            "body": json.dumps(translate,
                               cls=decimalencoder.DecimalEncoder)
        }
    else:
        response = {
            "statusCode": 404,
            "body": ""
        }
    return response

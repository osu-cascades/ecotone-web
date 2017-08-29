module Main exposing (..)

import Html exposing (Html, div, input, span, text)
import Html.Attributes as H exposing (..)
import Html.Events exposing (onInput)


--  MAIN


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    { value : String
    }


initialModel : Model
initialModel =
    { value = "20" }



-- UPDATE


type Msg
    = SlideTemperature String


update : Msg -> Model -> Model
update msg model =
    case msg of
        SlideTemperature temperature ->
            { model | value = temperature }



-- VIEW


view : Model -> Html Msg
view model =
    div [ id "temperature_wrapper" ]
        [ input
            [ type_ "range"
            , H.min "-30"
            , H.max "40"
            , H.defaultValue "20"
            , onInput SlideTemperature
            , name "biodiversity_report[temperature]"
            , id "biodiversity_report_temperature"
            ]
            []
        , div [ id "temperature_value" ]
            [ text (model.value ++ " °C") ]
        ]

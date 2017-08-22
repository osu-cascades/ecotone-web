module Main exposing (..)

import Html exposing (Html, p, text)


-- MODEL


type alias Model =
    {}



-- INIT


init : ( Model, Cmd Msg )
init =
    ( Model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    p [] [ text "Slider here (hello from elm)." ]



-- MESSAGE


type Msg
    = None



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

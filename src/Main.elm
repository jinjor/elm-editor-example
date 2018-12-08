port module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { value : String
    , lastSaved : String
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( Model "" "", Cmd.none )



-- UPDATE


type Msg
    = Input String
    | Save String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Input text ->
            ( { model | value = text }, Cmd.none )

        Save text ->
            ( { model | lastSaved = text }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    save Save



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "main" ]
        [ div [ class "editor" ]
            [ textarea
                [ id "editor"
                , style "display" "none"
                , onInput Input
                ]
                [ text "Hello, press `Ctrl+S` to see the result." ]
            ]
        , pre [ class "result" ] [ text model.lastSaved ]
        ]



-- PORTS


port save : (String -> msg) -> Sub msg

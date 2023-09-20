#include "gamecontroller.h"

#define DEFAULT_HORIZONTAL_TILES 128
#define DEFAULT_VERTICAL_TILES 128

#define HORIZONTAL_TILE_CONFIG "horizontal"
#define VERTICAL_TILE_CONFIG "vertical"

GameController::GameController(QObject *parent)
    : QObject{parent},
      m_verticalTiles(DEFAULT_VERTICAL_TILES),
      m_horizontalTiles(DEFAULT_HORIZONTAL_TILES)
{
}

GameController::~GameController()
{
}

quint64 GameController::getVerticalTiles()
{
    return m_verticalTiles;
}

quint64 GameController::getHorizontalTiles()
{
    return m_horizontalTiles;
}

void GameController::setVerticalTiles(quint64 tiles)
{
    m_verticalTiles = tiles;
}

void GameController::setHorizontalTiles(quint64 tiles)
{
    m_horizontalTiles = tiles;
}

void GameController::configure(QJsonObject configs)
{
    for(auto key : configs.keys())
    {
        auto value = configs.value(key);
        if(key == HORIZONTAL_TILE_CONFIG)
        {
            setHorizontalTiles(value.toInt());
            emit tilesChanged();
        }
        else if(key == VERTICAL_TILE_CONFIG)
        {
            setVerticalTiles(value.toInt());
            emit tilesChanged();
        }
    }
}

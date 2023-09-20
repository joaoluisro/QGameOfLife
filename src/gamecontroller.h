#ifndef GAMECONTROLLER_H
#define GAMECONTROLLER_H

#include <QObject>
#include <QJsonObject>
class GameController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(quint64 ui_verticalTiles READ getVerticalTiles WRITE setVerticalTiles NOTIFY tilesChanged)
    Q_PROPERTY(quint64 ui_horizontalTiles READ getHorizontalTiles WRITE setHorizontalTiles NOTIFY tilesChanged)

public:
    GameController(QObject *parent = nullptr);
    ~GameController();
    quint64 getVerticalTiles();
    quint64 getHorizontalTiles();

    void setVerticalTiles(quint64 tiles);
    void setHorizontalTiles(quint64 tiles);

    Q_INVOKABLE void configure(QJsonObject configs);
signals:
    void tilesChanged();
public:
    quint64 m_verticalTiles, m_horizontalTiles;
};

#endif // GAMECONTROLLER_H

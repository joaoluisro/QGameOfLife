#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "src/gamecontroller.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qRegisterMetaType<GameController*>("GameController");
    GameController *gameController = new GameController();

    const QUrl url(QStringLiteral("qrc:/src/view/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    engine.rootContext()->setContextProperty("GameController", gameController);

    return app.exec();
}

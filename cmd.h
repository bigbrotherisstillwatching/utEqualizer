#pragma once
#include <QProcess>
#include <QVariant>

class Process2 : public QProcess
{
    Q_OBJECT
public:
    explicit Process2( QObject* parent = Q_NULLPTR ) : QProcess( parent )
    { }

     // If want to use Start with arguments
    Q_INVOKABLE void start( const QString& program, const QVariantList& arguments )
    {
        QStringList args;

        // convert QVariantList from QML to QStringList for QProcess
        for ( const auto& temp : arguments ) {
            args << temp.toString();
        }

        QProcess::setProcessChannelMode( QProcess::MergedChannels );
        QProcess::start( program, args );
    }

    // If want to start without arguments for Qt > 5.14
    Q_INVOKABLE void start( const QString& program )
    {

        QProcess::setProcessChannelMode( QProcess::MergedChannels );
        QProcess::setProgram( program );
        QProcess::start();
        QProcess::open( QProcess::ReadWrite );
    }

    Q_INVOKABLE QByteArray readAll() { return QProcess::readAll(); }
    Q_INVOKABLE QByteArray readLine() { return QProcess::readLine(); }

     // if you want to write to an active process, not fully tested!
    Q_INVOKABLE qint64 write( const QString& data )
    {
        return QProcess::write( qPrintable( data ) );
    }

private:
    Q_DISABLE_COPY( Process2 )
};
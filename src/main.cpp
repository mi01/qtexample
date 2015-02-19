#include <QApplication>
#include "qt/surface.h"

int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	Surface window;
	window.setup();
	window.show();

	return app.exec();
}

#include <QApplication>
#include <QDesktopWidget>

#include "surface.h"
#include "moc/surface.cpp"

Surface::Surface(QWidget* parent) : QWidget(parent) {

}

Surface::~Surface() {

}

void Surface::setup() {

	resize(QApplication::desktop()->size());
	setWindowTitle("QT Example");
	setWindowState(this->windowState() | Qt::WindowMaximized);
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:provider/provider.dart';
import 'package:test_bondy/src/widgets/card_description.dart';
import 'package:test_bondy/src/widgets/card_temperature.dart';
import 'package:test_bondy/src/widgets/card_wind.dart';
import 'package:test_bondy/src/widgets/label_title.dart';
import 'package:test_bondy/src/widgets/not_found.dart';

import '../providers/provider.dart';
import '../services/service_time.dart';
import '../widgets/input.dart';

class PageTime extends StatefulWidget {
  const PageTime({super.key});

  @override
  State<PageTime> createState() => _PageTimeState();
}

class _PageTimeState extends State<PageTime> {
  Map _myData = {};
  String hour = '';

  final _apiTime = ServieTimer();
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  ProviderTime? provTime;

  @override
  Widget build(BuildContext context) {
    provTime = Provider.of<ProviderTime>(context);
    DateTime now = DateTime.now();
    hour = now.hour.toString().padLeft(2, '0');

    return LoadingOverlayPro(
      isLoading: provTime!.isLoading,
      child: Scaffold(
        body:
            (_myData.isNotEmpty) ? _containTimer(context) : const TagNotFound(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        floatingActionButton: _containButton(context),
      ),
    );
  }

  Widget _containTimer(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        _containHeader(context),
        _containWinInfo(context),
        _containTimeInfo(context),
        _containHourInfo(context),
        const SliverToBoxAdapter(child: SizedBox(height: 150))
      ],
    );
  }

  Widget _containHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: FadeInDown(
        duration: const Duration(milliseconds: 2000),
        child: CardTemperature(
            address: _myData['resolvedAddress'],
            temp: _myData['days'][0]['temp'],
            description: _myData['description'],
            maxTemp: _myData['days'][0]['tempmax'],
            minTemp: _myData['days'][0]['tempmin']),
      ),
    );
  }

  Widget _containWinInfo(BuildContext context) {
    return SliverToBoxAdapter(
      child: BounceInLeft(
        duration: const Duration(milliseconds: 2000),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InformationIcons(
                title: 'Viento',
                subTitle: '${_myData['days'][0]['windspeed']} km/h',
                icons: Icons.wind_power_rounded,
              ),
              InformationIcons(
                title: 'Humedad',
                subTitle: '${_myData['days'][0]['humidity']} %',
                icons: Icons.water_drop_rounded,
              ),
              InformationIcons(
                title: 'Rafaga Viento',
                subTitle: '${_myData['days'][0]['windgust']} %',
                icons: Icons.air,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _containTimeInfo(BuildContext context) {
    return SliverToBoxAdapter(
      child: BounceInLeft(
        duration: const Duration(milliseconds: 2000),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 10),
          child: Column(
            children: <Widget>[
              const LabelTitle(
                title: 'Tiempo',
                textColor: Colors.black,
                fontWeight: FontWeight.bold,
                alignment: Alignment.center,
                fontSize: 18,
              ),
              LabelTitle(
                title: _myData['days'][0]['description'],
                textColor: Colors.grey,
                alignment: Alignment.center,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverList _containHourInfo(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((_, index) {
        final _dataHour = _myData['days'][0]['hours'][index];
        return FadeInUp(
          duration: const Duration(milliseconds: 2000),
          child: Column(
            children: <Widget>[
              CardDesTime(
                backgroundColor: (_dataHour['datetime'] != '${hour}:00:00')
                    ? Colors.white
                    : Colors.grey,
                title:
                    '${_dataHour['datetime'].substring(0, _dataHour['datetime'].length - 3)}',
                subTitle: _dataHour['temp'],
                icons: _dataHour['icon'],
                windgust: '${_dataHour['windgust']}',
              ),
              const Divider()
            ],
          ),
        );
      }, childCount: _myData['days'][0]['hours'].length),
    );
  }

  //? Formulario para buscar por ciudad
  Widget _containButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            Flexible(
              child: CustomInput(
                labelText: '',
                hintText: 'Buscar',
                textEditingController: _searchController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Ingresa una ubicación';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 25,
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState!.validate()) {
                      provTime!.isLoading = true;
                      final data =
                          await _apiTime.timeLocation(_searchController.text);
                      _myData = data!;

                      provTime!.isLoading = false;
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

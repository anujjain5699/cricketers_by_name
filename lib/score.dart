// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

Welcome welcomeFromMap(String str) => Welcome.fromMap(json.decode(str));

String welcomeToMap(Welcome data) => json.encode(data.toMap());

class Welcome {
    Welcome({
        this.data,
        this.ttl,
        this.cache3,
        this.v,
        this.provider,
        this.creditsLeft,
    });

    List<Datum> data;
    int ttl;
    bool cache3;
    String v;
    Provider provider;
    int creditsLeft;

    factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        ttl: json["ttl"],
        cache3: json["cache3"],
        v: json["v"],
        provider: Provider.fromMap(json["provider"]),
        creditsLeft: json["creditsLeft"],
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "ttl": ttl,
        "cache3": cache3,
        "v": v,
        "provider": provider.toMap(),
        "creditsLeft": creditsLeft,
    };
}

class Datum {
    Datum({
        this.pid,
        this.fullName,
        this.name,
    });

    int pid;
    String fullName;
    String name;

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        pid: json["pid"],
        fullName: json["fullName"],
        name: json["name"],
    );

    Map<String, dynamic> toMap([List<Datum> l]) => {
        "pid": pid,
        "fullName": fullName,
        "name": name,
    };
}

class Provider {
    Provider({
        this.source,
        this.url,
        this.pubDate,
    });

    String source;
    String url;
    DateTime pubDate;

    factory Provider.fromMap(Map<String, dynamic> json) => Provider(
        source: json["source"],
        url: json["url"],
        pubDate: DateTime.parse(json["pubDate"]),
    );

    Map<String, dynamic> toMap() => {
        "source": source,
        "url": url,
        "pubDate": pubDate.toIso8601String(),
    };
}

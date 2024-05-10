//
//  MarvelResponse.swift
//  MarvelTests
//
//  Created by Orlando Nicolas Marchioli on 17/04/2024.
//

import Foundation

class MarvelResponse{
    let allComicsResponseMock = """
{
    "code": 200,
    "status": "Ok",
    "copyright": "© 2024 MARVEL",
    "attributionText": "Data provided by Marvel. © 2024 MARVEL",
    "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2024 MARVEL</a>",
    "etag": "31b7415c753a638f61640edf299b0934ebf6a366",
    "data": {
        "offset": 0,
        "limit": 20,
        "total": 59886,
        "count": 20,
        "results": [
            {
                "id": 82967,
                "digitalId": 0,
                "title": "Marvel Previews (2017)",
                "issueNumber": 0,
                "variantDescription": "",
                "description": "",
                "modified": "2019-11-07T08:46:15-0500",
                "isbn": "",
                "upc": "75960608839302811",
                "diamondCode": "",
                "ean": "",
                "issn": "",
                "format": "",
                "pageCount": 112,
                "textObjects": [],
                "resourceURI": "http://gateway.marvel.com/v1/public/comics/82967",
                "urls": [
                    {
                        "type": "detail",
                        "url": "http://marvel.com/comics/issue/82967/marvel_previews_2017?utm_campaign=apiRef&utm_source=b209d62336cd3526e0eb13f0bb429891"
                    }
                ],
                "series": {
                    "resourceURI": "http://gateway.marvel.com/v1/public/series/23665",
                    "name": "Marvel Previews (2017 - Present)"
                },
                "variants": [
                    {
                        "resourceURI": "http://gateway.marvel.com/v1/public/comics/82965",
                        "name": "Marvel Previews (2017)"
                    }
                ],
                "collections": [],
                "collectedIssues": [],
                "dates": [
                    {
                        "type": "onsaleDate",
                        "date": "2099-10-30T00:00:00-0500"
                    }
                ],
                "prices": [
                    {
                        "type": "printPrice",
                        "price": 0
                    }
                ],
                "thumbnail": {
                    "path": "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                    "extension": "jpg"
                },
                "images": [],
                "creators": {
                    "available": 1,
                    "collectionURI": "http://gateway.marvel.com/v1/public/comics/82967/creators",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/creators/10021",
                            "name": "Jim Nausedas",
                            "role": "editor"
                        }
                    ],
                    "returned": 1
                },
                "characters": {
                    "available": 0,
                    "collectionURI": "http://gateway.marvel.com/v1/public/comics/82967/characters",
                    "items": [],
                    "returned": 0
                },
                "stories": {
                    "available": 2,
                    "collectionURI": "http://gateway.marvel.com/v1/public/comics/82967/stories",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/183698",
                            "name": "cover from Marvel Previews (2017)",
                            "type": "cover"
                        }
                    ],
                    "returned": 2
                },
                "events": {
                    "available": 0,
                    "collectionURI": "http://gateway.marvel.com/v1/public/comics/82967/events",
                    "items": [],
                    "returned": 0
                }
            },
            {
                "id": 82965,
                "digitalId": 0,
                "title": "Marvel Previews (2017)",
                "issueNumber": 0,
                "variantDescription": "",
                "description": "",
                "modified": "2019-08-21T17:11:27-0400",
                "isbn": "",
                "upc": "75960608839302611",
                "diamondCode": "JUL190068",
                "ean": "",
                "issn": "",
                "format": "",
                "pageCount": 152,
                "textObjects": [],
                "resourceURI": "http://gateway.marvel.com/v1/public/comics/82965",
                "urls": [
                    {
                        "type": "detail",
                        "url": "http://marvel.com/comics/issue/82965/marvel_previews_2017?utm_campaign=apiRef&utm_source=b209d62336cd3526e0eb13f0bb429891"
                    }
                ],
                "series": {
                    "resourceURI": "http://gateway.marvel.com/v1/public/series/23665",
                    "name": "Marvel Previews (2017 - Present)"
                },
                "variants": [
                    {
                        "resourceURI": "http://gateway.marvel.com/v1/public/comics/82967",
                        "name": "Marvel Previews (2017)"
                    }
                ],
                "collections": [],
                "collectedIssues": [],
                "dates": [
                    {
                        "type": "onsaleDate",
                        "date": "2099-08-28T00:00:00-0500"
                    }
                ],
                "prices": [
                    {
                        "type": "printPrice",
                        "price": 0
                    }
                ],
                "thumbnail": {
                    "path": "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                    "extension": "jpg"
                },
                "images": [],
                "creators": {
                    "available": 0,
                    "collectionURI": "http://gateway.marvel.com/v1/public/comics/82965/creators",
                    "items": [],
                    "returned": 0
                },
                "characters": {
                    "available": 0,
                    "collectionURI": "http://gateway.marvel.com/v1/public/comics/82965/characters",
                    "items": [],
                    "returned": 0
                },
                "stories": {
                    "available": 0,
                    "collectionURI": "http://gateway.marvel.com/v1/public/comics/82965/stories",
                    "items": [],
                    "returned": 0
                },
                "events": {
                    "available": 0,
                    "collectionURI": "http://gateway.marvel.com/v1/public/comics/82965/events",
                    "items": [],
                    "returned": 0
                }
            }
}
"""
    let allCharactersResponseMock = """
{
    "code": 200,
    "status": "Ok",
    "copyright": "© 2024 MARVEL",
    "attributionText": "Data provided by Marvel. © 2024 MARVEL",
    "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2024 MARVEL</a>",
    "etag": "90958ce325b8d032b2272d1b0aeb22d460015c60",
    "data": {
        "offset": 0,
        "limit": 20,
        "total": 1564,
        "count": 20,
        "results": [
            {
                "id": 1011334,
                "name": "3-D Man",
                "description": "",
                "modified": "2014-04-29T14:18:17-0400",
                "thumbnail": {
                    "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                    "extension": "jpg"
                },
                "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
                "comics": {
                    "available": 12,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21366",
                            "name": "Avengers: The Initiative (2007) #14"
                        }
                    ],
                    "returned": 12
                },
                "series": {
                    "available": 3,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/series",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/1945",
                            "name": "Avengers: The Initiative (2007 - 2010)"
                        }
                    ],
                    "returned": 3
                },
                "stories": {
                    "available": 21,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/stories",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/19947",
                            "name": "Cover #19947",
                            "type": "cover"
                        }
                    ],
                    "returned": 20
                },
                "events": {
                    "available": 1,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/events",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/events/269",
                            "name": "Secret Invasion"
                        }
                    ],
                    "returned": 1
                },
                "urls": [
                    {
                        "type": "detail",
                        "url": "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=b209d62336cd3526e0eb13f0bb429891"
                    }
                ]
            },
            {
                "id": 1017100,
                "name": "A-Bomb (HAS)",
                "description": "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
                "modified": "2013-09-18T15:54:04-0400",
                "thumbnail": {
                    "path": "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16",
                    "extension": "jpg"
                },
                "resourceURI": "http://gateway.marvel.com/v1/public/characters/1017100",
                "comics": {
                    "available": 4,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1017100/comics",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/comics/47176",
                            "name": "FREE COMIC BOOK DAY 2013 1 (2013) #1"
                        }
                    ],
                    "returned": 4
                },
                "series": {
                    "available": 2,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1017100/series",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/series/17765",
                            "name": "FREE COMIC BOOK DAY 2013 1 (2013)"
                        }
                    ],
                    "returned": 2
                },
                "stories": {
                    "available": 7,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1017100/stories",
                    "items": [
                        {
                            "resourceURI": "http://gateway.marvel.com/v1/public/stories/92078",
                            "name": "Hulk (2008) #55",
                            "type": "cover"
                        }
                    ],
                    "returned": 7
                },
                "events": {
                    "available": 0,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1017100/events",
                    "items": [],
                    "returned": 0
                },
                "urls": [
                    {
                        "type": "detail",
                        "url": "http://marvel.com/characters/76/a-bomb?utm_campaign=apiRef&utm_source=b209d62336cd3526e0eb13f0bb429891"
                    },
                    {
                        "type": "comiclink",
                        "url": "http://marvel.com/comics/characters/1017100/a-bomb_has?utm_campaign=apiRef&utm_source=b209d62336cd3526e0eb13f0bb429891"
                    }
                ]
            }
}

"""
}

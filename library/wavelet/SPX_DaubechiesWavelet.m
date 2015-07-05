classdef SPX_DaubechiesWavelet

methods(Static)

    function qmf = on_qmf_filter(parameter)
        % Generates orthonormal quadrature mirror filter for Daubechies wavelet transform
        switch parameter
            case 4
                qmf = [   .482962913145   .836516303738   ...
                .224143868042   -.129409522551  ];
            case 6
                qmf = [   .332670552950   .806891509311   ...
                .459877502118   -.135011020010  ...
                -.085441273882  .035226291882   ];
            case 8
                qmf = [   .230377813309   .714846570553   ...
                .630880767930   -.027983769417  ...
                -.187034811719  .030841381836   ...
                .032883011667   -.010597401785  ];
            case 10
                qmf = [   .160102397974   .603829269797   .724308528438   ...
                .138428145901   -.242294887066  -.032244869585  ...
                .077571493840   -.006241490213  -.012580751999  ...
                .003335725285                                   ];
            case 12
                qmf = [   .111540743350   .494623890398   .751133908021   ...
                .315250351709   -.226264693965  -.129766867567  ...
                .097501605587   .027522865530   -.031582039317  ...
                .000553842201   .004777257511   -.001077301085  ];
            case 14
                qmf = [   .077852054085   .396539319482   .729132090846   ...
                .469782287405   -.143906003929  -.224036184994  ...
                .071309219267   .080612609151   -.038029936935  ...
                -.016574541631  .012550998556   .000429577973   ...
                -.001801640704  .000353713800                   ];
            case 16
                qmf = [   .054415842243   .312871590914   .675630736297   ...
                .585354683654   -.015829105256  -.284015542962  ...
                .000472484574   .128747426620   -.017369301002  ...
                -.044088253931  .013981027917   .008746094047   ...
                -.004870352993  -.000391740373  .000675449406   ...
                -.000117476784                                  ];
            case 18
                qmf = [   .038077947364   .243834674613   .604823123690   ...
                .657288078051   .133197385825   -.293273783279  ...
                -.096840783223  .148540749338   .030725681479   ...
                -.067632829061  .000250947115   .022361662124   ...
                -.004723204758  -.004281503682  .001847646883   ...
                .000230385764   -.000251963189  .000039347320   ];
            case 20
                qmf = [   .026670057901   .188176800078   .527201188932   ...
                .688459039454   .281172343661   -.249846424327  ...
                -.195946274377  .127369340336   .093057364604   ...
                -.071394147166  -.029457536822  .033212674059   ...
                .003606553567   -.010733175483  .001395351747   ...
                .001992405295   -.000685856695  -.000116466855  ...
                .000093588670   -.000013264203                  ];
            otherwise
                error('Unsupported parameter');
        end
    end

end


end
